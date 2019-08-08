FROM ubuntu:18.04
MAINTAINER James Hunt <james@niftylogic.com>

ARG bbr_version=1.5.1
ARG bosh_version=6.0.0
ARG cf_version=6.46.0
ARG credhub_version=2.5.2
ARG fly_version=5.4.1
ARG genesis_version=2.6.17
ARG jq_version=1.6
ARG kubectl_version=1.15.2
ARG safe_version=1.3.0
ARG spruce_version=1.22.0
ARG terraform_version=0.12.6
ARG vault_version=1.2.1

RUN apt-get update \
 && apt-get install -y \
      curl wget \
      git \
      tmux tmate screen \
      tree file \
      vim \
      bzip2 zip unzip \
      lsof \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 \
 && echo "Installing 'bbr' v${bbr_version}" \
 &&   curl -sLo /usr/bin/bbr https://github.com/cloudfoundry-incubator/bosh-backup-and-restore/releases/download/v${bbr_version}/bbr-${bbr_version}-linux-amd64 \
 &&   chmod 0755 /usr/bin/bbr \
 &&   /usr/bin/bbr -v \
 \
 && echo "Installing 'bosh' v${bosh_version}" \
 &&   curl -sLo /usr/bin/bosh https://github.com/cloudfoundry/bosh-cli/releases/download/v${bosh_version}/bosh-cli-${bosh_version}-linux-amd64 \
 &&   chmod 0755 /usr/bin/bosh \
 &&   /usr/bin/bosh -v \
 \
 && echo "Installing 'cf' v${cf_version}" \
 &&   curl -sLo cf.tar.gz "https://packages.cloudfoundry.org/stable?release=linux64-binary&version=${cf_version}" \
 &&   tar -xzf cf.tar.gz \
 &&   mv cf /usr/bin/cf \
 &&   chmod 0755 ./usr/bin/cf \
 &&   rm -f cf.tar.gz \
 &&   /usr/bin/cf --version \
 \
 && echo "Installing 'credhub' v${credhub_version}" \
 &&   curl -sLo credhub.tar.gz https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/${credhub_version}/credhub-linux-${credhub_version}.tgz \
 &&   tar -xzf credhub.tar.gz \
 &&   mv credhub /usr/bin/credhub \
 &&   chmod 0755 /usr/bin/credhub \
 &&   rm -f credhub.tar.gz \
 &&   /usr/bin/credhub --version \
 \
 && echo "Installing 'fly v${fly_version}'" \
 &&   curl -sLo fly.tar.gz https://github.com/concourse/concourse/releases/download/v${fly_version}/fly-${fly_version}-linux-amd64.tgz \
 &&   tar -xzf fly.tar.gz \
 &&   mv fly /usr/bin/fly \
 &&   chmod 0755 /usr/bin/fly \
 &&   rm -f fly.tar.gz \
 &&   /usr/bin/fly -v \
 \
 && echo "Installing 'genesis' ${genesis_version}" \
 &&   curl -sLo /usr/bin/genesis https://github.com/genesis-community/genesis/releases/download/v${genesis_version}/genesis \
 &&   chmod 0755 /usr/bin/genesis \
 &&   /usr/bin/genesis -v \
 \
 && echo "Installing 'jq' ${jq_version}" \
 &&   curl -sLo /usr/bin/jq https://github.com/stedolan/jq/releases/download/jq-${jq_version}/jq-linux64 \
 &&   chmod 0755 /usr/bin/jq \
 &&   /usr/bin/jq --version \
 \
 && echo "Installing 'kubectl' v${kubectl_version}" \
 &&   curl -sLo /usr/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v${kubectl_version}/bin/linux/amd64/kubectl \
 &&   chmod 0755 /usr/bin/kubectl \
 &&   /usr/bin/kubectl version --client \
 \
 && echo "Installing 'safe' v${safe_version}" \
 &&   curl -sLo /usr/bin/safe https://github.com/starkandwayne/safe/releases/download/v${safe_version}/safe-linux-amd64 \
 &&   chmod 0755 /usr/bin/safe \
 &&   /usr/bin/safe -v \
 \
 && echo "Installing 'spruce' v${spruce_version}" \
 &&   curl -sLo /usr/bin/spruce https://github.com/geofffranks/spruce/releases/download/v${spruce_version}/spruce-linux-amd64 \
 &&   chmod 0755 /usr/bin/spruce \
 &&   /usr/bin/spruce -v \
 \
 && echo "Installing 'terraform' v${terraform_version}" \
 &&   curl -sLo terraform.zip https://releases.hashicorp.com/terraform/${terraform_version}/terraform_${terraform_version}_linux_amd64.zip \
 &&   unzip -q terraform.zip \
 &&   mv terraform /usr/bin/terraform \
 &&   chmod 0755 /usr/bin/terraform \
 &&   rm terraform.zip \
 &&   /usr/bin/terraform -v \
 \
 && echo "Installing 'vault' v${vault_version}" \
 &&   curl -sLo vault.zip https://releases.hashicorp.com/vault/${vault_version}/vault_${vault_version}_linux_amd64.zip \
 &&   unzip -q vault.zip \
 &&   mv vault /usr/bin/vault \
 &&   chmod 0755 /usr/bin/vault \
 &&   rm vault.zip \
 &&   /usr/bin/vault -v \
 \
 && echo "DONE"
